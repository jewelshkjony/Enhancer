# 🔦 Enhancer
A powerful tool to change target api level, inject assets, native (.so) libraries and sign the apk.

![image](https://github.com/jewelshkjony/Enhancer/assets/75406851/ad7914b1-bb26-4d9f-81f5-4594d0d34374)

## 🪶 Features
* Change `compileSdkVersion`/`targetSdkVersion`
* Inject assets files
* Inject native (.so) libraries
* Sign the apk using your keystore file

## Installation
> **Note**: Before installing Enhancer, make sure that you've JDK 8 or above installed.

### Windows
In PowerShell, run:
```ps1
iwr https://raw.githubusercontent.com/jewelshkjony/Enhancer/main/install.ps1 -useb | iex
```

### Linux and macOS
1. In the terminal, run:

    ```sh
    curl https://raw.githubusercontent.com/jewelshkjony/Enhancer/main/install.sh -fsSL | sh
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

3. If you only want to sign the apk and don't want to inject assets, native (.so) libraries so write `N` on every prompts. So the tool will skip the injecting process. When you're only signing the apk so the output apk will override the origianl apk. And if you're injecting assets or native (.so) libraries so the tool will provide a new apk (originalApk-enhanced.apk).

4. That's it, now you can install the generated apk.
