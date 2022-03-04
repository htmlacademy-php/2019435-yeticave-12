<?php

date_default_timezone_set("Europe/Moscow");
require_once('helpers.php');

$categories = [
    "Доски и лыжи", "Крепления", "Ботинки", "Одежда", "Инструменты", "Разное"
];
$adverts = [
    [
        'name' => '2014 Rossignol District Snowboard',
        'category' => 'Доски и лыжи',
        'price' => '10999',
        'url' => 'img/lot-1.jpg',
        'close' => '2022-03-02'
    ],
    [
        'name' => 'DC Ply Mens 2016/2017 Snowboard',
        'category' => 'Доски и лыжи',
        'price' => '159999',
        'url' => 'img/lot-2.jpg',
        'close' => '2022-03-03'
    ],
    [
        'name' => 'Крепления Union Contact Pro 2015 года размер L/XL',
        'category' => 'Крепления',
        'price' => '8000',
        'url' => 'img/lot-3.jpg',
        'close' => '2022-03-04'
    ],
    [
        'name' => 'Ботинки для сноуборда DC Mutiny Charocal',
        'category' => 'Ботинки',
        'price' => '10999',
        'url' => 'img/lot-4.jpg',
        'close' => '2022-03-05'
    ],
    [
        'name' => 'Куртка для сноуборда DC Mutiny Charocal',
        'category' => 'Одежда',
        'price' => '7500',
        'url' => 'img/lot-5.jpg',
        'close' => '2022-03-06'
    ],
    [
        'name' => 'Маска Oakley Canopy',
        'category' => 'Разное',
        'price' => '5400',
        'url' => 'img/lot-6.jpg',
        'close' => '2022-03-08'
    ]
];

function priceFormat($price): string
{
    $price = ceil($price);
    if ($price < 1000) {
        $formatted = $price;
    } else {
        $formatted = number_format($price, 0, '', ' ');
    }
    return $formatted . ' &#8381';
}

$page_content = include_template('main.php', ['categories' => $categories, 'adverts' => $adverts]);
$layout_content = include_template('layout.php', [
    'categories' => $categories,
    'content' => $page_content,
    'pageName' => 'Главная'
]);

print($layout_content);
