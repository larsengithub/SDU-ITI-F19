<?php


namespace models;


class ImageDatabaseEntry
{
    /**
     * @var string
     */
    public $filehash;

    /**
     * @var string
     */
    public $extension;

    /**
     * @var int
     */
    public $image_id;

    /**
     * ImageDatabaseEntry constructor.
     */
    public function __construct()
    {
        settype($this->image_id, 'int');
    }


    public function get_filename(): string
    {
        return "$this->filehash.$this->extension";
    }

    public function get_image_url(): string
    {
        return "/api/image/?id=$this->image_id";
    }
}