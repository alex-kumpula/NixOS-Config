To install this NixOS configuration on a fresh NixOS installation, do the following:



Run the command:

```
export NIX_CONFIG="experimental-features = nix-command flakes"
```

Then run:

```
nix shell nixpkgs#git --command git clone https://github.com/alex-kumpula/NixOS-Config.git
```

Finally, run the install.sh file in the repo:

```
cd NixOS-Config
```

```
sudo bash install.sh
```
