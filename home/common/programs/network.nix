{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    amnezia-vpn
    amneziawg-tools
    amneziawg-go
    throne
    sing-box
    byedpi
    zapret
    wireguard-tools
    nmap
    mtr
    trippy
    bandwhich
    tcpdump
    wireshark
    iperf3
    doggo
    socat
    ethtool
    netcat-gnu
    openssl
    sshpass
  ];
}
