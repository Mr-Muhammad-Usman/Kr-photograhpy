@push('js')
    <script type="text/javascript">
        $( document ).ready(function() {
            function myFunction123 () {

                    var data = null;
                    var url = '{{route('authcheck')}}';
                    var res = AjaxRequest(url,data);
                    if(res.status==1)
                    {
                        window.location.replace("{{route('user_login')}}");
                    }else{

                    }
            }
            var interval = setInterval(function () { myFunction123(); }, 1000);
        });

    </script>
@endpush
