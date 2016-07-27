<?php
namespace ITECH\Home;

class Module
{
    public function registerAutoloaders()
    {
        $loader = new \Phalcon\Loader();

        $loader->registerNamespaces(array(
            'ITECH\Home\Controller' => ROOT . '/app/home/controller/',
            'ITECH\Home\Component' => ROOT . '/app/home/component/',
            'ITECH\Home\Form' => ROOT . '/app/home/form/',
            'ITECH\Home\Form\Validator' => ROOT . '/app/home/form/validator/',
            'ITECH\Data\Lib' => ROOT . '/app/data/lib/'
        ));
        $loader->register();
    }

    public function registerServices($di)
    {
        $config = $di->getService('config')->getDefinition();

        $di->setShared('volt', function($view, $di) use ($config) {
            $volt = new \Phalcon\Mvc\View\Engine\Volt($view, $di);

            $volt->setOptions(array(
                'compiledPath' => ROOT . '/cache/home/volt/',
                'compiledSeparator' => $config->volt->compiled_separator,
                'compileAlways' => (bool)$config->volt->debug,
                'stat' => (bool)$config->volt->stat
            ));

            $compiler = $volt->getCompiler();

            $compiler->addFunction('in_array', 'in_array');
            $compiler->addFunction('http_build_query', 'http_build_query');
            $compiler->addFunction('uniqid', 'uniqid');
            $compiler->addFunction('strtotime', 'strtotime');
            $compiler->addFunction('date', 'date');
            $compiler->addFunction('nl2br', 'nl2br');
            $compiler->addFunction('rand', 'rand');
            $compiler->addFunction('implode', 'implode');
            $compiler->addFunction('array_merge', 'array_merge');

            $compiler->addFunction('hashId', function($id) {
                return "\ITECH\Data\Lib\Util::hashId({$id})";
            });

            $compiler->addFunction('currencyFormat', function($number) {
                return "\ITECH\Data\Lib\Util::currencyFormat({$number})";
            });

            $compiler->addFunction('countFormat', function($number) {
                return "\ITECH\Data\Lib\Util::countFormat({$number}, '.', ',')";
            });

            $compiler->addFunction('removeDoubleQuote', function ($str) {
                return "\ITECH\Data\Lib\Util::removeDoubleQuote({$str})";
            });

            $compiler->addFunction('getTimeAgo', function($timestamp) {
                return "\ITECH\Data\Lib\Util::getTimeAgo({$timestamp})";
            });

            $compiler->addFunction('cutTextByChars', function($timestamp) {
                return "\ITECH\Data\Lib\Util::cutTextByChars({$timestamp})";
            });

            $compiler->addFunction('getPriceSearch', function() {
                return "\ITECH\Data\Lib\Constant::getPriceSearch()";
            });

            $compiler->addFunction('getAdultSearch', function() {
                return "\ITECH\Data\Lib\Constant::getAdultSearch()";
            });

            $compiler->addFunction('getChildrenSearch', function() {
                return "\ITECH\Data\Lib\Constant::getChildrenSearch()";
            });

            $compiler->addFunction('getTypeSearch', function() {
                return "\ITECH\Data\Lib\Constant::getTypeSearch()";
            });

            $compiler->addFunction('getMinRoomSearch', function() {
                return "\ITECH\Data\Lib\Constant::getMinRoomSearch()";
            });

            $compiler->addFunction('getMaxRoomSearch', function() {
                return "\ITECH\Data\Lib\Constant::getMaxRoomSearch()";
            });

            $compiler->addFunction('getSortByPrice', function() {
                return "\ITECH\Data\Lib\Constant::getSortByPrice()";
            });

            $compiler->addFunction('getTrend', function() {
                return "\ITECH\Data\Lib\Constant::getTrend()";
            });

            $compiler->addFunction('getApartmentCondition', function() {
                return "\ITECH\Data\Lib\Constant::getApartmentCondition()";
            });

            $compiler->addFunction('getApartmentConditionClass', function() {
                return "\ITECH\Data\Lib\Constant::getApartmentConditionClass()";
            });

            $compiler->addFunction('getArticleFengShuiType', function() {
                return "\ITECH\Data\Lib\Constant::getArticleFengShuiType()";
            });

            $compiler->addFunction('getUserGender', function() {
                return "\ITECH\Data\Lib\Constant::getUserGender()";
            });

            $compiler->addFunction('niceWordsByChars', function($text, $expr) use ($compiler) {
                if (isset($expr[0])) {
                    $first = $compiler->expression($expr[0]['expr']);
                } else {
                    $first = $text;
                }

                if (isset($expr[1])) {
                    $second = $compiler->expression($expr[1]['expr']);
                } else {
                    $second = '50';
                }

                return "\ITECH\Data\Lib\Util::niceWordsByChars($first, $second)";
            });

            return $volt;
        });

        $di->setShared('view', function() {
            $view = new \Phalcon\Mvc\View();
            $view->setViewsDir(ROOT . '/app/home/view/');
            $view->registerEngines(array(
                '.volt' => 'volt'
            ));

            return $view;
        });
    }
}