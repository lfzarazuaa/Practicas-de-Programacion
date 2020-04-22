<?php

    class Job{
        public $title;
        public $description;
        public $visible;
        public $months;
    }

    $job1 = new Job();//Reservándolo en memoria.
    $job1->title = 'PHP Developer';
    $job1->description = "This is an awesome job";
    $job1->visible = true;
    $job1->months = 16;

    $jobs = [
    [
      'title' => 'PHP Dev',
      'description' => 'This is an awesome job',
      'visible' => true,
      'months' => 46
    ],
    [
      'title' => 'Python Dev',
      'description' => 'PyQt',
      'visible' => false,
      'months' => 3
    ],
    [
      'title' => 'Devops',
      'description' => 'DevOthers',
      'visible' => false,
      'months' => 4
    ],
    [
      'title' => 'Node Dev',
      'description' => 'DevOthers',
      'visible' => true,
      'months' => 5
    ],
    [
      'title' => 'Frontend Dev',
      'description' => 'DevOthers',
      'visible' => true,
      'months' => 2
    ],
  ];

  function getDuration($months){
    $years = floor($months/12);
    $extraMonths = $months%12;
    $stryears = $years!=1?" años ":"año ";
    $strmonths = $extraMonths!=1?" meses ":"mes ";
    $cadena = ($years>0? $years . $stryears : '') . ($extraMonths>0? $extraMonths . $strmonths : '');
    return $cadena;
  }

  function printJob($job){
    //Contenido de la función
    if ($job['visible'] == false) 
    {
      return;//Termina una ejecución del ciclo.
    }
    echo '<li class="work-position">';
    echo '<h5>' . $job['title'] . '</h5>';
    echo '<p>' . $job['description']. '</p>';
    echo '<p>' . getDuration($job['months']) . '</p>';
    //echo '<p> Meses totales:' . $totalMonths. '</p>';
    echo '<strong>Achievements:</strong>';
    echo '<ul>';
    echo '<li>Lorem ipsum dolor sit amet, 80% consectetuer adipiscing elit.</li>';
    echo '<li>Lorem ipsum dolor sit amet, 80% consectetuer adipiscing elit.</li>';
    echo '<li>Lorem ipsum dolor sit amet, 80% consectetuer adipiscing elit.</li>';
    echo '</ul>';
    echo '</li>';
  }
?>