from flask import Flask, request, jsonify
import statistics

app = Flask(__name__)

@app.route('/')
def home():
    return '''
    <h1>API Analisis Data Statistik</h1>
    <p>Gunakan endpoint: <code>/analisis?data=angka1,angka2,...</code></p>
    <p>Contoh: <a href="/analisis?data=10,20,30,20,40,20,50">/analisis?data=10,20,30,20,40,20,50</a></p>
    '''

@app.route('/analisis')
def analisis():
    data_str = request.args.get('data', '')
    if not data_str:
        return jsonify({"error": "Parameter 'data' wajib diisi"}), 400
    try:
        numbers = [float(x.strip()) for x in data_str.split(',') if x.strip()]
        if len(numbers) < 2:
            return jsonify({"error": "Minimal 2 angka"}), 400
        mean_val = statistics.mean(numbers)
        median_val = statistics.median(numbers)
        try:
            mode_val = statistics.mode(numbers)
        except:
            mode_val = None
        return jsonify({
            "data": numbers,
            "jumlah": len(numbers),
            "mean": mean_val,
            "median": median_val,
            "mode": mode_val if mode_val else "Tidak ada modus unik",
            "min": min(numbers),
            "max": max(numbers)
        })
    except:
        return jsonify({"error": "Data tidak valid"}), 400

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
