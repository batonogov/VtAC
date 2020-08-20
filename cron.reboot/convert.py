import os, glob
from moviepy.editor import *
from pysndfx import AudioEffectsChain


CIFS_PATH = os.getenv('CIFS_PATH')
CIFS_USER = os.getenv('CIFS_USER')
CIFS_PASS = os.getenv('CIFS_PASS')

if not os.path.exists('/tmp/lan'):
    os.mkdir('/tmp/lan')

os.system('mount -t cifs %s /tmp/lan -o user=%s,password=%s' % (CIFS_PATH, CIFS_USER, CIFS_PASS))

# Уровень усилния лимитера и обработки компандера
fx = (
    AudioEffectsChain()
    .normalize()
    .limiter(gain = 7)
    .compand(attack = 2, soft_knee = 6.1, threshold = -22)
)

x = 0
# Ищем файлы с указанным расширением
files = glob.glob('/tmp/lan/*.mp4')
# Перебираевм в цикле все файлы и конвертируем их в нужный формат
while x < len(files):
    print(x + 1, '/', len(files), 'Найден файл:', files[x])
    # С нормализацией звука
    clip = VideoFileClip(os.path.join(files[x]))
    # Преобразование во временный файл wav
    clip.audio.write_audiofile(os.path.join(files[x][0:-4] + '.wav'))
    # Применение эффектов и преобразование в mp3
    fx(files[x][0:-4] + '.wav', files[x][0:-4] + '.mp3')
    print(x + 1, '/', len(files), 'Создан файл:', files[x][0:-4] + '.mp3')
    # Удаление лишних файлов
    os.remove(files[x][0:-4] + '.wav')
    os.remove(os.path.join(files[x]))
    x = x + 1

os.system('umount /tmp/lan')

if os.path.exists('/tmp/lan'):
    os.rmdir('/tmp/lan')

if len(files) == 0:
    print('Файлов mp4 не обнаружено')
