from flask import Flask
from pydub import AudioSegment
from pydub.playback import play

app = Flask(__name__)

@app.route('/')
def hello_world():
    song = AudioSegment.from_mp3("/media/bell.mp3")
    play(song + 24)
    return 'Ding, dong!'