{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
     
     home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
     };
     
     dgop = {
       url = "github:AvengeMedia/dgop";
       inputs.nixpkgs.follows = "nixpkgs";
     };

     dms-cli = {
       url = "github:AvengeMedia/danklinux";
       inputs.nixpkgs.follows = "nixpkgs";
     };

     dankMaterialShell = {
       url = "github:AvengeMedia/DankMaterialShell";
       inputs.nixpkgs.follows = "nixpkgs";
       inputs.dgop.follows = "dgop";
       inputs.dms-cli.follows = "dms-cli";
     };
     
     niri = {
       url = "github:sodiboo/niri-flake";
       inputs.nixpkgs.follows = "nixpkgs";
     };
};

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    # use "nixos", or your hostname as the name of the configuration
    # it's a better practice than "default" shown in the video
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
          {
            home-manager = {
		useGlobalPkgs = true;
		useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
		users.phouvongviphop = import ./home.nix;
		backupFileExtension = "backup";
            };
          }
        # inputs.home-manager.nixosModules.default
      ];
    };
  };
}
