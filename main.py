#!/usr/bin/env python3
import fire
import subprocess
import ini
import os.path
from os import remove as removefile

__composer_not_installed__ = "Composer can't start because he is not installed! Install it at https://getcomposer.org/doc/00-intro.md#globally!"
__install_loc_not_set__ = "Flarum installation location is not set! Please set it first using flame locate LOCATION!"
__config_file_name__ = "flameconf.ini"

if not os.path.exists(__config_file_name__):
    open(__config_file_name__, "a").close()

conf_e = ini.parse(open(__config_file_name__, "r").read())

def confsave():
    removefile(__config_file_name__)
    with open(__config_file_name__, "w") as f:
        f.write(ini.stringify(conf_e))
        f.close()

def err(e):
    return "ERROR: " + e


def check_env():
    try:
        t = conf_e["install_loc"]
    except:
        print(err(__install_loc_not_set__))
        os._exit(1)
    


def install(ext):
    check_env()
    subprocess.run("cd " + os.environ[__install_loc_env__] + " | composer require -q -n " + ext, shell=True,
                   check=True)


def uninstall(ext):
    check_env()
    subprocess.run("cd " + os.environ[__install_loc_env__] + " | composer remove -q -n " + ext, shell=True,
                   check=True)


class Flame(object):
    """
    Flame V1\n
    A extension installer for Flarum.
    """

    def install(self, extension):
        """Installs a extension."""
        print("Installing the extension " + extension + "...")
        try:
            install(extension)
        except subprocess.CalledProcessError as e:
            if e.returncode == 127:
                return err(__composer_not_installed__)
                os._exit(1)
        else:
            return "Extension " + extension + " have been correctly installed!"

    def uninstall(self, extension):
        """Uninstalls a extension."""
        print("Uninstalling the extension " + extension + "...")
        try:
            uninstall(extension)
        except subprocess.CalledProcessError as e:
            if e.returncode == 127:
                return err(__composer_not_installed__)
                os._exit(1)
        else:
            return "Extension " + extension + " have been correctly uninstalled!"

    def locate(self, location):
        """Changes the configuration for the location of Flarum installation."""
        try:
            conf_e["install_loc"] = location
            confsave()
        except:
            return err(__install_loc_not_set__)
            os._exit(1)
        else:
            return "I have correctly changed the install location!"


if __name__ == '__main__':
    fire.Fire(Flame)
