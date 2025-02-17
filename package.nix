{
  fetchFromGitHub,
  buildDotnetModule,
  dotnetCorePackages,
  lib,
}:
buildDotnetModule rec {
  pname = "source-2-viewer";
  version = "11.1";

  src = fetchFromGitHub {
    owner = "ValveResourceFormat";
    repo = "ValveResourceFormat";
    tag = version;
    hash = "sha256-BJtD2J90LP3m7IEA5CIGaMPJssIUQlgqfSdgP3VaP7c=";
  };

  dotnet-sdk = dotnetCorePackages.sdk_9_0;

  projectFile = "Decompiler/Decompiler.csproj";

  executables = [ "Source2Viewer-CLI" ];

  nugetDeps = ./deps.json;

  meta = {
    description = "Tool for working with various Source 2 resource formats";
    homepage = "https://github.com/ValveResourceFormat/ValveResourceFormat";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ justdeeevin ];
    platforms = lib.platforms.linux;
    mainProgram = "Source2Viewer-CLI";
  };
}
