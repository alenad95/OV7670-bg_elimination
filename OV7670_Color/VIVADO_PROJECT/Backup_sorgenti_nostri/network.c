/*
 * network.c
 *
 *  Created on: 15 feb 2017
 *      Author: Mattia Bernasconi
 *        Mail: mattia@studiobernasconi.com
 */

#include "network.h"

/* missing declaration in lwIP */
void lwip_init();
int start_udp_application(unsigned local_port, unsigned remote_port);
int transfer_data();

void print_ip_settings(struct ip_addr *ip, struct ip_addr *mask, struct ip_addr *gateway);

struct udp_pcb* pcb;

static struct netif server_netif;
struct netif *udp_netif;

static int counter = 0;

void print_ip(char *msg, struct ip_addr *ip)
{
	print(msg);
	xil_printf("%d.%d.%d.%d\n", ip4_addr1(ip), ip4_addr2(ip), ip4_addr3(ip), ip4_addr4(ip));
}

void print_ip_settings(struct ip_addr *ip, struct ip_addr *mask, struct ip_addr *gateway)
{
	print_ip("Board IP: ", ip);
	print_ip("Netmask : ", mask);
	print_ip("Gateway : ", gateway);
}

struct ip_addr netmask, gateway;

//the mac address of the board
unsigned char mac_ethernet_address[] = { 0x00, 0x0a, 0x35, 0x00, 0x01, 0x02 };

int init_network()
{
	//Disabilito le data cache
	Xil_DCacheDisable();

	/* initliaze IP addresses to be used */
	IP4_ADDR(&ipaddr,  192, 168,   1, 50);
	IP4_ADDR(&netmask, 255, 255, 255,  0);
	IP4_ADDR(&gateway, 192, 168,   1,  1);

	/* Remote ip address */
	IP4_ADDR(&d_addr,  192, 168,   1, 100);

	//netif_add(udp_netif, &ipaddr, &netmasck, &gateway, NULL, NULL, ethernet_input());
	lwip_init();

	return XST_SUCCESS;
}

int start_udp()
{
	udp_netif = &server_netif;

	/* Add network interface to the netif_list, and set it as default */
	if (!xemac_add(udp_netif, &ipaddr, &netmask, &gateway, mac_ethernet_address, PLATFORM_EMAC_BASEADDR))
	{
		xil_printf("Error adding N/W interface\n\r");
		return -1;
	}

	udp_netif->mtu = MTU_SIZE;

	netif_set_default(udp_netif);

	/* specify that the network if is up */
	netif_set_up(udp_netif);

	netif_set_link_up(udp_netif);

	xil_printf("Setting netif\n");
	print_ip_settings(&udp_netif->ip_addr, &udp_netif->netmask, &udp_netif->gw);

	start_udp_application(LOCAL_PORT, REMOTE_PORT);

	return XST_SUCCESS;
}

void recv_callback(void * arg, struct udp_pcb * upcb, struct pbuf * p,  struct ip_addr * addr, u16_t port)
{
	/* Funzione da definirsi: richiamata quando arriva un pacchetto UDP */

	printf("recv_callback\n");

	pbuf_free(p);
}

int start_udp_application(unsigned local_port, unsigned remote_port)
{
	pcb = udp_new();
	if (!pcb)
	{
		xil_printf("Error creating PCB. Out of Memory\n\r");
		return XST_FAILURE;
	}

	/* bind to specific port */
	if(udp_bind(pcb, IP_ADDR_ANY, local_port) != ERR_OK)
	{
		xil_printf("Unable to bind to port %d: err = %d\n\r", local_port, err);
		return XST_FAILURE;
	}

	if(udp_connect(pcb, IP_ADDR_BROADCAST, remote_port) != ERR_OK)
	{
		xil_printf("Unable to connect to port %d: err = %d\n\r", remote_port, err);
		return XST_FAILURE;
	}

	/* Registro la funzione di callBack */
	udp_recv(pcb, recv_callback, NULL);

	xil_printf("UDP server started Local@ port %d ", pcb->local_port);
	print_ip(" @ and Ip: ", &pcb->local_ip);
	xil_printf("UDP server started Remote @ port %d", pcb->remote_port);
	print_ip(" @ and Ip: ", &pcb->remote_ip);

	return XST_SUCCESS;
}

void frame_written_callback(int frame_index)
{
	xemacif_input(udp_netif);

	int i;
	for(i = 0; i < FRAME_SIZE / FRAME_UDP_FRAGMENT_SIZE; i++)
	{
		// Modified PBUF_RAM (Mingarelli) with PBUF_REF (Ciotti & Aleotti)
		struct pbuf* p = pbuf_alloc(PBUF_TRANSPORT, sizeof(packet_data), PBUF_REF);

		if(!p)
		{
			xil_printf("Errore allocazione pbuf: %d\n", i);
			exit(1);
		}

		packet_data* buff = (packet_data*) p->payload;
		buff->count = counter++;
		buff->fragment = i;
		buff->frame_index = frame_index;


#ifdef SEND_PROCESSED_IMAGE
		//Normal
		BYTE* ddr_address = ((BYTE*) FRAME_BUFFER_BASE_ADDR) + frame_index*FRAME_SIZE + i*FRAME_UDP_FRAGMENT_SIZE;
		memcpy(buff->data, ddr_address, FRAME_UDP_FRAGMENT_SIZE);
#endif


#ifdef SEND_LUMA_IMAGE
		//Luma
		BYTE* ddr_address_luma = ((BYTE*) FRAME_BUFFER_BASE_ADDR + 0x2000000) + frame_index*FRAME_SIZE + i*FRAME_UDP_FRAGMENT_SIZE;
		memcpy(buff->data_luma, ddr_address_luma, FRAME_UDP_FRAGMENT_SIZE);
#endif

#ifdef SEND_CHROMA_IMAGE
		//Chroma
		BYTE* ddr_address_chroma = ((BYTE*) FRAME_BUFFER_BASE_ADDR + 0x1000000) + frame_index*FRAME_SIZE + i*FRAME_UDP_FRAGMENT_SIZE;
		memcpy(buff->data_chroma, ddr_address_chroma, FRAME_UDP_FRAGMENT_SIZE);
#endif

// #if 0

#ifdef SEND_PROCESSED_IMAGE
		//printf("Sending PROCESSED_IMAGE\n");
#endif

#ifdef SEND_LUMA_IMAGE
		//printf("Sending LUMA_IMAGE\n");
#endif

#ifdef SEND_CHROMA_IMAGE
		//printf("Sending CHROMA_IMAGE\n");
#endif

// #endif

		//usleep(50);

		if(udp_send(pcb, p) != ERR_OK)
			xil_printf("Errore nell'invio del pacchetto %d\n", i);

		//usleep(50);

		pbuf_free(p);
	}
	counter++;

	//Debug only
	//printf("[Info] Callback frame index %d/%d - total %d\n", frame_index, FRAME_BUFFER_NUM, counter);
}
