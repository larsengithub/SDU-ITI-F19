<?php

declare(strict_types=1);

namespace framework;


class ActionResult
{
    private $value;
    /**
     * @var int
     */
    private $status;

    public function __construct($value, int $status)
    {
        $this->value = $value;
        $this->status = $status;
    }

    public function to_json()
    {
        return json_encode($this->value);
    }

    public function get_status(): int
    {
        return $this->status;
    }

    public function has_body(): bool
    {
        return !!$this->value;
    }
}