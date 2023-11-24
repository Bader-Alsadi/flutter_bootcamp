<?php
$arr= '[
    {
        "a" : "aaaaa",
        "b" : [
            {
                "c" : "c11",
                "d" : "d11",
                "f" : [ 5, 2 ]
            },
            {
                "c" : "c33",
                "d" : "d33",
                "f" : [ 5, 2 ]
            }
        ],
        "e" : 3
    },
    {
        "a" : "zzzzz",
        "b" : [
            {
                "c" : "c22",
                "d" : "d22",
                "f" : [ 9, 3 ]
            },
            {
                "c" : "c44",
                "d" : "d44",
                "f" : [ 9, 3 ]
            }
        ],
        "e" : 5
    }
    ]
    '
;

function print_dd ($p){
    if(is_array($p)){
        foreach($p as $v)
         print_dd($v);
        }
        else
        echo "$p <br>";

}


print_dd(json_decode($arr,true));
?>