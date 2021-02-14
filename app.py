from glob import glob
from flask import Flask, request
from pydub import AudioSegment
from pydub.playback import play

app = Flask(__name__)

@app.route('/play')
def play_file():
    filename = request.args.get("filename")
    audio_segment = AudioSegment.from_file(f"./media/{filename}", filename.split(".")[-1])
    play(audio_segment + 24)
    return 'Ding, dong!'