<?php
	if (empty($data)) exit('no data');


// Pa range exist?
	foreach ($data as $row) :
		if ($row['unit_name'] == 'Па') { echo '<li class="header">Па</li>'; break; }
	endforeach;

	foreach ($data as $row) :
		if ($row['unit_name'] == 'Па'){
			echo '<li value="' . $row[0] . '">'. $row[1] .'</li>';
		}
	endforeach;

echo '<li class="header disabled"><a href="#">кПа</a></li>';
	foreach ($data as $row) :
		if ($row['unit_name'] == 'кПа'){
			echo '<li value="' . $row[0] . '">'. $row[1] .'</li>';
		}
	endforeach;

echo '<li class="header">мПа</li>';
	foreach ($data as $row) :
		if ($row['unit_name'] == 'МПа'){
			echo '<li value="' . $row[0] . '">'. $row[1] .'</li>';
		}
	endforeach;
 ?>