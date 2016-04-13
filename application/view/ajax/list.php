<?php
if (empty($data)) { exit('no data'); };
	foreach($data as $item): ?>
		<li value="<?= $item[0] ?>"><?= $item[1] ?></li>
<?php endforeach; ?>

