from glob import glob
from flask import Flask, request
from pydub import AudioSegment
from pydub.playback import play

filename = "bell.mp3"
audio_segment = AudioSegment.from_file(f"./media/{filename}", filename.split(".")[-1])

app = Flask(__name__)

@app.route('/play')
def play_file():
    play(audio_segment + 24)
    return 'Ding, dong!'
