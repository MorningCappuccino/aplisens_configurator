
<?php
/*
 * Admin Controller
 */


class AdminController extends Controller
{
	public function __constuct()
	{
		parent::__construct();
	}

	public function index()
	{
		$this->View->renderAdmin('admin/index');
	}
}
