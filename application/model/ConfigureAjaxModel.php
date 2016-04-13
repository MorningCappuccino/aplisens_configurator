<?php

/**
 *
 */

class ConfigureAjaxModel
{

	public static function getAllEqMode()
	{

		$database = DatabaseFactory::getFactory()->getConnection();

		$sql = "SELECT * FROM equipment_mode";
		$query = $database->prepare($sql);
		$query->execute();

		return $query->fetchAll();

	}

	public static function getAccuracyClassesByEqModeId($id)
	{
		$database = DatabaseFactory::getFactory()->getConnection();

		$sql = "SELECT *
						FROM accuracy
						  JOIN link_eq_mode_accuracy ON accuracy.id = link_eq_mode_accuracy.fk_accuracy_id
						  JOIN equipment_mode ON link_eq_mode_accuracy.fk_eq_mode_id = equipment_mode.eq_mode_id
						WHERE eq_mode_id = :id";
		$query = $database->prepare($sql);
		$query->execute(array(':id' => $id));

		return $query->fetchAll();
	}

	public static function getSpecialVersionsByEqModeId($id)
	{
		$database = DatabaseFactory::getFactory()->getConnection();

		$sql = "SELECT *
						FROM special_version
						  JOIN link_eq_mode_special_version l ON special_version.id = l.fk_special_version_id
						  JOIN equipment_mode ON l.fk_eq_mode_id = equipment_mode.eq_mode_id
						WHERE eq_mode_id = :id";
		$query = $database->prepare($sql);
		$query->execute(array(':id' => $id));

		return $query->fetchAll();
	}

	public static function getMeasurementRangesByEqModeIDAndAccuracyID($eq_mode_id)
	{
		$database = DatabaseFactory::getFactory()->getConnection();

		$sql = "SELECT *, units.name as unit_name
						FROM measurement_range
						  JOIN link_eq_mode_measurement_range l ON measurement_range.id = l.fk_measurement_range_id
						  JOIN equipment_mode ON l.fk_eq_mode_id = eq_mode_id
						  JOIN units ON measurement_range.unit_id = units.id
						WHERE eq_mode_id = :id";
		$query = $database->prepare($sql);
		$query->execute(array(':id' => $eq_mode_id));

		return $query->fetchAll();
	}

}