import os, sys, random, fileinput, subprocess
from set_wall import setwallpaper


def supported(theme):
    '''
    Check if the given theme is supported.

    Args:
        theme (str): the given theme's name which is assumed to be entirely
            lower case

    Returns:
        bool: based on whether the given theme is supported or not
    '''
    supported_themes = ['gruvbox', 'onedark', 'dracula', 'nord', 'light']
    
    if theme in supported_themes:
        return True

    return False


def set_wall(theme):
    path = f'/home/{ os.environ["USER"] }/.wallpapers/{ theme }/'

    path += random.choice([
        x for x in os.listdir(path)
        if os.path.isfile(os.path.join(path, x))
    ])
    setwallpaper(path)


def set_code(theme):
    '''
    Set Visual Studio Code's theme according to the given theme. First, each
    supported theme is associated with its according vs-code theme in a 
    dictionary. Second, the path to the settings file for vs-code is located. 
    Finally, the line for color theme is updated to match the given theme.

    Args:
        theme (str): the given theme's name which is assumed to be supported

    Returns:
        None
    '''
    vs_themes = {
        'gruvbox': 'Gruvbox Dark Medium',
        'onedark': 'One Dark Pro',
        'dracula': 'Dracula',
        'nord': 'Nord',
        'light': 'Atom One Light'
    }

    path = f'/home/{ os.environ["USER"] }/.config/Code/User/settings.json'
    try:
        for line in fileinput.input([path], inplace=True):
            if line.strip().startswith('"workbench.colorTheme":'):
                line = f'\t"workbench.colorTheme": "{ vs_themes[theme] }",\n'
            sys.stdout.write(line)
    except FileNotFoundError:
        print('VS Code not set. (settings file not found).')


def set_kde(theme):
    kde_themes = {
        'gruvbox': 'GruvboxPlasma',
        'onedark': 'OneDark',
        'dracula': 'Dracula',
        'nord': 'Nordic-darker',
        'light': 'com.github.yeyushengfan258.McSur-light'
    }

    cmd = f'lookandfeeltool -a {kde_themes[theme]}'
    subprocess.run(cmd.split())


def set_konsole(theme):
    konsole_themes = {
        'gruvbox': 'Gruvbox',
        'onedark': 'One Dark',
        'dracula': 'Dracula',
        'nord': 'Nordic',
        'light': 'Breeze Light'
    }

    path = f'/home/{ os.environ["USER"] }/.local/share/konsole/Profile 1.profile'
    try:
        for line in fileinput.input([path], inplace=True):
            if line.strip().startswith('ColorScheme'):
                line = f'ColorScheme={konsole_themes[theme]}\n'
            sys.stdout.write(line)
    except FileNotFoundError:
        print('Konsole not set. (settings file not found).')


if __name__ == "__main__":
    new_theme = str(sys.argv[1]).lower()
    if supported(new_theme):
        set_wall(new_theme)
        set_code(new_theme)
        set_kde(new_theme)
        set_konsole(new_theme)
        subprocess.run('kquitapp5 plasmashell && kstart5 plasmashell', shell=True, executable='/bin/bash')
