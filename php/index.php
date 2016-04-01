<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require 'vendor/autoload.php';

$app = new \Slim\App;

$app->get('/', function (Request $req, Response $res)
{
    $params = $req->getQueryParams();
    $str    = $params['str'];
    $len    = $params['len'];
    $ch     = $params['ch'];

    return $res->withJson(array('str' => str_pad($str, $len, $ch, STR_PAD_LEFT)));
});

$app->run();

