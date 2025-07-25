import argparse
import os
from TTS.api import TTS

def main():
    parser = argparse.ArgumentParser(description="MeloTTS inference script")
    parser.add_argument('--input', type=str, required=True, help='Path to input text file')
    parser.add_argument('--output', type=str, required=True, help='Path to output wav file')
    parser.add_argument('--speed', type=float, default=1.0, help='Speech speed multiplier')

    args = parser.parse_args()

    # Load text from input file
    with open(args.input, 'r', encoding='utf-8') as f:
        text = f.read()

    # Initialize TTS model (choose a suitable pre-trained model)
    # You can change the model_name to a preferred MeloTTS model
    model_name = "tts_models/en/ljspeech/tacotron2-DDC"
    tts = TTS(model_name)

    # Synthesize speech with speed control
    wav = tts.tts(text, speaker=None, speed=args.speed)

    # Save to output file
    tts.save_wav(wav, args.output)
    print(f"Audio saved to {args.output}")

if __name__ == "__main__":
    main()
