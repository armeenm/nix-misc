{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "launchk";
  version = "0.3.1";

  src = fetchFromGitHub {
    owner = "intellekthq";
    repo = "launchk";
    rev = "launchk-${finalAttrs.version}";
    hash = "sha256-j9ZU3owYtbKBG4rxZG7GyWymYsFSGR9OJSV+21KBq/A=";
  };

  patches = [ ./git.patch ];

  cargoHash = "sha256-k/n22Bfg857bWFl8sVhZI3YI2i9JuWmT28zN86W/ing=";

  nativeBuildInputs = [
    rustPlatform.bindgenHook
  ];

  meta = {
    description = "Rust/Cursive TUI for observing launchd agents and daemons";
    homepage = "https://github.com/intellekthq/launchk";
    license = lib.licenses.mit;
  };
})
