@extends('admin.layouts.main')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/cdbootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/cdbootstrap/css/cdb.min.css" />
<script src="https://cdn.jsdelivr.net/npm/cdbootstrap/js/cdb.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/cdbootstrap/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/9d1d9a82d2.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
@section('content')

<main>
    <section>
        <div class="card chart-container">
            <canvas id="chart1"></canvas>
        </div>
    </section>
</main>
@endsection
@push('js')
    <script>
        const ctx1 = document.getElementById("chart1").getContext('2d');
        const myChart1 = new Chart(ctx1, {
            type: 'line',
            data: {
                labels: ["Jan", "Feb", "Mar",
                    "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                datasets: [{
                    label: 'Last week',
                    backgroundColor: 'rgba(161, 198, 247, 1)',
                    borderColor: 'rgb(47, 128, 237)',
                    // data: [3000, 4000, 2000, 5000, 8000, 9000, 2000, 2000, 5000, 8000, 9000, 2000],
                    data: [
                        @foreach($monthly_sale as $item)
                            {{$item}},
                            @endforeach

                    ]

                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true,
                        }
                    }]
                },
                plugins: {
                    legend: {
                        labels: {
                            usePointStyle: true,
                        },
                    }
                }
            },
        });
    </script>
@endpush
