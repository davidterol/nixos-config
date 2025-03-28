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
      pkgs.dbeaver-bin
    ]
  );
}
