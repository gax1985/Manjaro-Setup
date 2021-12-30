import os, sys, random, subprocess
from kde_wall_setter import setwallpaper


def supported(theme):
    supported_themes = ['low', 'med', 'hi']

    if theme in supported_themes:
        return True

    return False


def set_wall(theme):
    path = f'/home/{os.environ["USER"]}/.wallpapers/{theme}/'

    path += random.choice([
        x for x in os.listdir(path)
        if os.path.isfile(os.path.join(path, x))
    ])

    cmd = f'wal -qi {path}'

    if theme == 'hi':
        cmd += ' -l'

    subprocess.run(cmd.split())
    setwallpaper(path)


def set_kde():
    path = f'/home/{os.environ["USER"]}/.scripts/theme/'
    path += 'KDE_Pywal_Color_Scheme_Generator.sh'
    subprocess.call(['sh', path])

    cmd = f'plasma-theme -c /home/{os.environ["USER"]}/'
    cmd += '.local/share/color-schemes/pywal.colors'
    subprocess.run(cmd.split())


def set_discord():
    path = f'/home/{os.environ["USER"]}/.scripts/theme/'
    path += 'Discord_Color_Generator.sh'
    subprocess.call(['sh', path])


def set_spotify():
    path = f'/home/{os.environ["USER"]}/.scripts/theme/'
    path += 'Spicetify_Color_Generator.sh'
    subprocess.call(['sh', path])

    cmd = 'spicetify apply'
    subprocess.run(cmd.split())


if __name__ == "__main__":
    new_theme = str(sys.argv[1]).lower()
    if supported(new_theme):
        set_wall(new_theme)
        set_kde()
        set_discord()
        set_spotify()
        subprocess.run('clear')