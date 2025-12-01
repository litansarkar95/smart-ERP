<?php
defined('BASEPATH') OR exit('No direct script access allowed');

if (!function_exists('convert_to_bengali')) {
    function convert_to_bengali($number) {
        $english_digits = array('0', '1', '2', '3', '4', '5', '6', '7', '8', '9');
        $bengali_digits = array('০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯');

        return str_replace($english_digits, $bengali_digits, $number);
    }
}




//

// application/helpers/number_helper.php

if (!function_exists('number_to_words')) {
    function number_to_words($num) {
        $words = array(
            0 => 'Zero', 1 => 'One', 2 => 'Two', 3 => 'Three', 4 => 'Four',
            5 => 'Five', 6 => 'Six', 7 => 'Seven', 8 => 'Eight', 9 => 'Nine',
            10 => 'Ten', 11 => 'Eleven', 12 => 'Twelve', 13 => 'Thirteen', 14 => 'Fourteen',
            15 => 'Fifteen', 16 => 'Sixteen', 17 => 'Seventeen', 18 => 'Eighteen', 19 => 'Nineteen',
            20 => 'Twenty', 30 => 'Thirty', 40 => 'Forty', 50 => 'Fifty', 60 => 'Sixty',
            70 => 'Seventy', 80 => 'Eighty', 90 => 'Ninety'
        );

        // Function to handle the conversion of numbers below 1000
        $convert_to_words = function($n) use ($words) {
            if ($n == 0) {
                return '';
            }

            $result = '';
            if ($n >= 100) {
                $hundreds = floor($n / 100);
                $result .= $words[$hundreds] . " Hundred ";
                $n = $n % 100;
            }

            if ($n > 0) {
                if ($n < 20) {
                    $result .= $words[$n];
                } else {
                    $tens = floor($n / 10) * 10;
                    $ones = $n % 10;
                    $result .= $words[$tens];
                    if ($ones) {
                        $result .= " " . $words[$ones];
                    }
                }
            }

            return trim($result);
        };

        // Handle the number groups like Lakh and Crore
        if ($num == 0) {
            return $words[0];
        }

        $result = '';

        // Process lakhs and thousands
        if ($num >= 100000) {
            $lakhs = floor($num / 100000);
            $result .= $convert_to_words($lakhs) . " Lakh ";
            $num = $num % 100000;
        }

        if ($num >= 1000) {
            $thousands = floor($num / 1000);
            $result .= $convert_to_words($thousands) . " Thousand ";
            $num = $num % 1000;
        }

        // Handle the remaining part (hundreds, tens, and ones)
        $result .= $convert_to_words($num);

        return trim($result);
    }


    function convert_date_ddmmyyyy_to_yyyymmdd($date)
{
    $dateTime = DateTime::createFromFormat('d-m-Y', $date);
    if($dateTime){
        return $dateTime->format('Y-m-d');
    }
    return null; // invalid date
}
}

