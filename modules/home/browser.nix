{
  inputs,
  pkgs,
  host,
  ...
}:
{
  home.packages = (
    with pkgs;
    [
      #inputs.zen-browser.packages."${system}".default
      # pkgs.librewolf
      pkgs.brave
      pkgs.dbeaver-bin
    ]
  );
}
