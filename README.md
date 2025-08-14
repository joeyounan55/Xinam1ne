<img src="https://repo.keycap.one/icons/Xinam1ne.png" width="64" />

# Xinam1ne

Rootless arm64e jailbreak for iOS 15.0 - 15.4.1.

Official website / download: https://xina.cypwn.xyz

## Building on Windows

1. Install LLVM/Clang. The easiest way is via [winget](https://learn.microsoft.com/windows/package-manager/winget/):

   ```powershell
   winget install -e --id LLVM.LLVM
   ```

   Alternatively download the LLVM installer from [llvm.org](https://releases.llvm.org/).

2. Obtain an Apple SDK and set the toolchain and SDK paths before invoking `make`:

   ```powershell
   set TOOLCHAIN=clang
   set SDK_PATH=C:\path\to\iPhoneOS.sdk
   make
   ```

   (Use `$env:VAR="value"` in PowerShell.)

### Why Xinam1ne instead of Dopamine?

Honestly, do what you want. Dopamine works fine to some extent. A lot of you ask me what changes with Xinam1ne and I always have to type out the same old stuff, so have a list of what Xinam1ne has that Dopamine doesn't:
- Xina-like symlinks for older rootful tweaks which are created upon jailbreaking (so DRM for said tweaks can load w/o issue in rare cases)
- Cypwn-oriented colors
- A toggle to stay on stock Dopamine vs. Xinam1ne w/ symlinks

That's all folks!

<img src="https://media.tenor.com/xvo8-YQ78P0AAAAC/porky-pig.gif)https://media.tenor.com/xvo8-YQ78P0AAAAC/porky-pig.gif" width="320" />
