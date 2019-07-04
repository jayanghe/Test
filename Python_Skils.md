## Python 3.7 安装PyUserInput
### 1.安装pyhook  
<https://www.lfd.uci.edu/~gohlke/pythonlibs/>
</br>
下载whl文件 (如pyHook‑1.5.1‑cp37‑cp37m‑win_amd64.whl)
</br></br>

安装pyHook
```cmd
pip install pyHook‑1.5.1‑cp37‑cp37m‑win_amd64.whl
```
### 2.安装pyuserinput
```cmd
pip install pyuserinput
```

## Python 反编译Pyinstaller打包exe文件 
### 1.pyinstxtractor.py 解包exe
#### 1.下载pyinstxtractor.py 
```cmd
pyinstxtractor.py xxx.exe
```
在xxx_extracted文件夹中找到</br>
xxx无后缀的文件</br>
struct文件</br>
以Hex查看,将struct的头部信息复制到xxx的最前面</br>
xxx加上后缀.pyc
#### 2.uncompyle 反编译 .pyc
    pip install uncompyle

    uncompyle6 xxx.pyc > xxx.py   

