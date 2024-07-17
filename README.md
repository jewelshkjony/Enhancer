# 🔦 Enhancer
A powerful tool to inject assets, dex, manifest, resources & native (.so) libraries and sign the apk.

![Screenshot 2024-07-17 164036](https://github.com/user-attachments/assets/388e7ec6-38f3-456b-a31e-89e0d2f0b0f4)

## 🪶 Features
* Change `compileSdkVersion`/`targetSdkVersion`
* Inject assets files
* Inject native (.so) libraries
* Inject dex files
* Inject extra resources
* Inject manifest.xml file.
* Sign the apk using your keystore file

## Installation
> **Note**: Before installing Enhancer, make sure that you've JDK 8 or above installed.

### Windows
In PowerShell, run:
```ps1
iwr https://raw.githubusercontent.com/jewelshkjony/Enhancer/2.0.0/install.ps1 -useb | iex
```

### Linux and macOS
1. In the terminal, run:

    ```sh
    curl https://raw.githubusercontent.com/jewelshkjony/Enhancer/2.0.0/install.sh -fsSL | sh
    ```

2. To run Enhancer write `chmod +x Enhancer.sh` on terminal.

## Quick start
Now, that you've installed Enhancer, let's try this tool.

1. Open the terminal and write `Enhancer`.
This will show you some prompts.
    - `Enter apk path`: Set the path of the apk or drag the apk file here.
    - `Enter keystore path`: Set the keystore path or drag the keystore file here. <b>Enhancer</b> tool will use this keystore file to sign your apk.
    - `Want to change SDK version? Y/N`: Write `Y` if you want to change `compileSdkVersion`/`targetSdkVersion`. If you've entered `Y` then it'll ask for enter `compileSdkVersion` & `compileSdkVersionCodeName`.
    - `Want to inject assets? Y/N` : If you want to inject assets file so write `Y` now it'll ask for the directory path of asstes files.
    - `Want to inject native libraries? Y/N` : If you want to inject (.so) native libraries so write `Y` now it'll ask for the directory path of native libraries.
    - `Want to inject dex files? Y/N` : If you want to inject .dex files so write `Y` now it'll ask for the path of dex file. If you want to inject multiple files, separate the paths with commas.
    - `Want to inject extra resources? Y/N` : If you want to inject any additional resources so write `Y` now it'll ask for resources directory path. It'll follow the name of directory to inject. If you want to inject multiple directory, separate the directory paths with commas.
    - `Want to inject manifest.xml? Y/N` : If you want to inject AndroidManifest.xml write `Y` and set the path of Manifest.xml.

3. If you only want to sign the apk and don't want to inject anything so write `N` on every prompts. So the tool will skip the injecting process. When you're only signing the apk so the output apk will override the origianl apk. And if you're injecting assets or native (.so) libraries so the tool will provide a new apk (originalApk-enhanced.apk).

4. That's it, now you can install the generated apk.

## Uninstallation
> **Note**: Not recommended. Try to delete files from `Local` and remove path manually from Environment.

### Windows
In PowerShell, run:
```ps1
iwr https://raw.githubusercontent.com/jewelshkjony/Enhancer/2.0.0/uninstall.ps1 -useb | iex
```

### Linux and macOS
In terminal, run:
```ps1
curl https://raw.githubusercontent.com/jewelshkjony/Enhancer/2.0.0/uninstall.sh -fsSL | sh
```
