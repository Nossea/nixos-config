{inputs, pkgs, ...}:

{
      imports = [
            ./bluetooth.nix  
            ./cloud.nix  
            ./code.nix  
            ./container.nix  
            ./dns.nix  
            ./exploits.nix  
            ./forensics.nix  
            ./fuzzers.nix  
            ./generic.nix  
            ./hardware.nix  
            ./host.nix  
            ./information-gathering.nix
            ./internet
            ./kubernetes.nix  
            ./ldap.nix  
            ./load-testing.nix  
            ./malware.nix  
            ./misc.nix  
            ./mobile.nix
            ./network
            ./packet-generators.nix  
            ./password.nix  
            ./port-scanners.nix  
            ./proxies.nix  
            ./services.nix  
            ./smartcards.nix  
            ./terminals.nix  
            ./tls.nix  
            ./traffic.nix  
            ./tunneling.nix  
            ./voip.nix  
            ./web.nix  
            ./windows.nix  
            ./wireless.nix  
      ];
}
  
