{ pkgs, ... }:

{
  programs.git = {
    enable = true;
	userName  = "Shubham-Vy";
    userEmail = "shubhamvyas1691@hotmail.com";
    extraConfig = {
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
    };
  };
}
