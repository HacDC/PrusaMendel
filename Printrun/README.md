Printrun consists of printcore, pronsole and pronterface, and a small collection of helpful scripts.

  * printcore.py is a library that makes writing reprap hosts easy
  * pronsole.py is an interactive command-line host software with tabcompletion goodness
  * pronterface.py is a graphical host software with the same functionality as pronsole

# GETTING PRINTRUN

This section suggests using precompiled binaries, this way you get everything bundled into one single package for an easy installation.

If you want the newest, shiniest features, you can run Printrun from source using the instructions further down this README.

## Windows

A precompiled version is available at http://koti.kapsi.fi/~kliment/printrun/

*Note:* Prontserve is not currently included in the windows binary.

## Mac OS X

A precompiled version is available at http://koti.kapsi.fi/~kliment/printrun/

*Note:* Prontserve is not currently included in the OSX binary.

## Linux
### Ubuntu/Debian

You can run Printrun directly from source, as there are no packages available yet. Fetch and install the dependencies using

1. `sudo apt-get install python-serial python-wxgtk2.8 python-pyglet python-tornado python-setuptools python-libxml2 python-gobject avahi-daemon libavahi-compat-libdnssd1`
2. `sudo easy_install pybonjour tornado`
3. `sudo easy_install https://github.com/D1plo1d/py-mdns/archive/master.zip`

### Fedora 17 and newer

You can install Printrun from official packages. Install the whole package using

`sudo yum install printrun`

Or get only apps you need by

`sudo yum install pronsole` or `pronterface` or `plater`

Adding `--enablerepo updates-testing` option to `yum` might give you newer packages (but also not very tested).

You can also run Printrun directly from source, if the packages are too old for you anyway, or you have Fedora 15 or 16. Fetch and install the dependencies using

1. `sudo yum install pyserial wxpython pyglet python-tornado`
2. `sudo apt-get install avahi-daemon python-avahi tornado`
2. `sudo easy_install https://github.com/D1plo1d/py-mdns/archive/master.zip`

### Archlinux

Packages are available in AUR. Just run

`yaourt printrun`

and enjoy the `pronterface`, `pronsole`, ... commands directly.

*Note:* Prontserve is not currently included in the arch package.

# USING PRONTERFACE

When you're done setting up Printrun, you can start pronterface.py in the directory you unpacked it.
Select the port name you are using from the first drop-down, select your baud rate, and hit connect.
Load an STL (see the note on skeinforge below) or GCODE file, and you can upload it to SD or print it directly.
The "monitor printer" function, when enabled, checks the printer state (temperatures, SD print progress) every 3 seconds.
The command box recognizes all pronsole commands, but has no tabcompletion.

If you want to load stl files, you need to install a slicing program such as Slic3r and add its path to the settings.
See the Slic3r readme for more details on integration.


# USING PRONSERVE

Prontserve runs a server for remotely monitoring and controlling your 3D printer over your network.

To start the server you can run `./prontserve.py` in the directory you git cloned printrun too. Once the server starts you can verify it's working by going to http://localhost:8888 in your web browser.


# USING PRONSOLE

To use pronsole, you need:

  * python (ideally 2.6.x or 2.7.x),
  * pyserial (or python-serial on ubuntu/debian) and
  * pyreadline (not needed on Linux)

Start pronsole and you will be greeted with a command prompt. Type help to view the available commands.
All commands have internal help, which you can access by typing "help commandname", for example "help connect"

If you want to load stl files, you need to put a version of skeinforge (doesn't matter which one) in a folder called "skeinforge".
The "skeinforge" folder must be in the same folder as pronsole.py

# USING PRINTCORE

To use printcore you need python (ideally 2.6.x or 2.7.x) and pyserial (or python-serial on ubuntu/debian)
See pronsole for an example of a full-featured host, the bottom of printcore.py for a simple command-line
sender, or the following code example:

    p=printcore('/dev/ttyUSB0',115200)
    p.startprint(data) # data is an array of gcode lines
    p.send_now("M105") # sends M105 as soon as possible
    p.pause()
    p.resume()
    p.disconnect()

# RUNNING FROM SOURCE

Run Printrun for source if you want to test out the latest features.

## Dependencies

To use pronterface, you need:

  * python (ideally 2.6.x or 2.7.x),
  * pyserial (or python-serial on ubuntu/debian)
  * pyglet
  * numpy (for 3D view)
  * pyreadline (not needed on Linux) and
  * argparse (installed by default with python >= 2.7)
  * wxPython (some features such as Tabbed mode work better with wx 2.9)
  * pycairo (to use Projector feature)

Please see specific instructions for Windows and Mac OS X below. Under Linux, you should use your package manager directly (see the "GETTING PRINTRUN" section)

## Windows

Download the following, and install in this order:

  1. http://python.org/ftp/python/2.7.2/python-2.7.2.msi
  2. http://pypi.python.org/packages/any/p/pyserial/pyserial-2.5.win32.exe
  3. http://downloads.sourceforge.net/wxpython/wxPython2.8-win32-unicode-2.8.12.0-py27.exe
  4. https://pypi.python.org/packages/any/p/pyreadline/pyreadline-1.7.1.win32.exe
  5. http://pyglet.googlecode.com/files/pyglet-1.1.4.zip

For the last one, you will need to unpack it, open a command terminal, 
go into the the directory you unpacked it in and run
`python setup.py install`

## Mac OS X Lion

  1. Ensure that the active Python is the system version. (`brew uninstall python` or other appropriate incantations)
  2. Download an install [wxPython2.8-osx-unicode] matching to your python version (most likely 2.7 on Lion, 
        check with: python --version) from: http://wxpython.org/download.php#stable
  Known to work PythonWX: http://superb-sea2.dl.sourceforge.net/project/wxpython/wxPython/2.8.12.1/wxPython2.8-osx-unicode-2.8.12.1-universal-py2.7.dmg
  3. Download and unpack pyserial from http://pypi.python.org/packages/source/p/pyserial/pyserial-2.5.tar.gz
  4. In a terminal, change to the folder you unzipped to, then type in: `sudo python setup.py install`
  5. Repeat 4. with http://http://pyglet.googlecode.com/files/pyglet-1.1.4.zip

The tools will probably run just fine in 64bit on Lion, you don't need to mess
with any of the 32bit settings. In case they don't, try 
  5. export VERSIONER_PYTHON_PREFER_32_BIT=yes
in a terminal before running Pronterface

## Mac OS X (pre Lion)

A precompiled version is available at http://koti.kapsi.fi/~kliment/printrun/

  1. Download and install http://downloads.sourceforge.net/wxpython/wxPython2.8-osx-unicode-2.8.12.0-universal-py2.6.dmg
  2. Grab the source for pyserial from http://pypi.python.org/packages/source/p/pyserial/pyserial-2.5.tar.gz
  3. Unzip pyserial to a folder. Then, in a terminal, change to the folder you unzipped to, then type in:
     
     `defaults write com.apple.versioner.python Prefer-32-Bit -bool yes`
     
     `sudo python setup.py install`

Alternatively, you can run python in 32 bit mode by setting the following environment variable before running the setup.py command:

This alternative approach is confirmed to work on Mac OS X 10.6.8. 

`export VERSIONER_PYTHON_PREFER_32_BIT=yes`

`sudo python setup.py install`

Then repeat the same with http://http://pyglet.googlecode.com/files/pyglet-1.1.4.zip

# LICENSE

```
Printrun is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Printrun is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Printrun.  If not, see <http://www.gnu.org/licenses/>.
```

All scripts should contain this license note, if not, feel free to ask us. Please note that files where it is difficult to state this license note (such as images) are distributed under the same terms.
