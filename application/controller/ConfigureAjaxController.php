<?php
/**
 * Class FilmAjaxController
 */

class ConfigureAjaxController extends Controller {

	public function __construct()
	{
		parent::__construct();

		// Auth::checkAuthentication();
	}


	public function getAllEqMode()
	{

		$this->viewAjax->render('ajax/list', ConfigureAjaxModel::getAllEqMode() );

	}

	public function getAccuracyClassesByEqModeID($data)
	{

		$id = $data->eq_mode_id;
		$this->viewAjax->render('ajax/list', ConfigureAjaxModel::getAccuracyClassesByEqModeId($id) );

	}

	public function getSpecialVersionsByEqModeID($data)
	{

		$id = $data->eq_mode_id;
		$this->viewAjax->render('ajax/list', ConfigureAjaxModel::getSpecialVersionsByEqModeId($id) );

	}

	public function getMeasurementRangesByEqModeIDAndAccuracyID($data)
	{
		$eq_mode_id = $data->eq_mode_id;
		$accuracy_id = null;
		$this->viewAjax->render('ajax/rangeList', ConfigureAjaxModel::getMeasurementRangesByEqModeIDAndAccuracyID($eq_mode_id));
	}



}