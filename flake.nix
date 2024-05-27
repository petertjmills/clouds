{
    description = "Cumulus configuration";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    };

    outputs = { self, nixpkgs, ...}@inputs: {
        nixosConfigurations.cumulus = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ./hosts/cumulus/configuration.nix
            ];
        };
    };
}