<?php


namespace services;


use models\FeedEntry;
use models\ImageDatabaseEntry;
use models\UploadedFile;
use repositories\FeedRepository;

class FeedService
{
    /**
     * @var FeedRepository
     */
    private $feedRepository;

    /**
     * @var ImageService
     */
    private $imageService;
    /**
     * @var SessionService
     */
    private $sessionService;

    /**
     * @var CommentService
     */
    private $commentService;

    /**
     * FeedService constructor.
     * @param FeedRepository $feedRepository
     * @param ImageService $imageService
     * @param SessionService $sessionService
     */
    public function __construct(FeedRepository $feedRepository, ImageService $imageService, SessionService $sessionService, CommentService $commentService)
    {
        $this->feedRepository = $feedRepository;
        $this->imageService = $imageService;
        $this->sessionService = $sessionService;
        $this->commentService = $commentService;
    }


    /**
     * Creates a new feed entry
     *
     * @param string $title
     * @param string $description
     * @param UploadedFile $image
     * @return FeedEntry
     */
    public function create_feed_entry(string $title, string $description, UploadedFile $image): FeedEntry
    {
        $image_entry = $this->imageService->save_image($image);

        $user_id = $this->sessionService->get_active_user_id();

        $feed_entry = $this->feedRepository->create_feed_entry($user_id, $image_entry->image_id, $description, $title);

        return new FeedEntry(
            $feed_entry->entry_id,
            $image_entry->get_image_url(),
            $feed_entry->title,
            $feed_entry->description,
            $user_id,
            $feed_entry->user_id == $user_id,
            array(),
        );
    }

    /**
     * Loads the full feed
     *
     * @return FeedEntry[]
     */
    public function get_feed(): array
    {
        $feed_entries = $this->feedRepository->get_full_feed();

        $image_ids = array_unique(array_map(function ($entry) {
            return $entry->image_id;
        }, $feed_entries));

        /**
         * @var ImageDatabaseEntry[] $images
         */
        $images = array();

        foreach ($image_ids as $image_id) {
            $images[$image_id] = $this->imageService->get_image_entry($image_id);
        }

        $user_id = $this->sessionService->get_active_user_id();

        $filled_feed_entries = array();

        foreach ($feed_entries as $entry) {
            $comments = $this->commentService->get_comments_for_feed_entry($entry->entry_id);

            $filled_feed_entries[] = new FeedEntry(
                $entry->entry_id,
                $images[$entry->image_id]->get_image_url(),
                $entry->title,
                $entry->description,
                $user_id,
                $entry->user_id == $user_id,
                $comments,
            );
        }

        return $filled_feed_entries;
    }

    /**
     * @param int $entry_id
     *
     * @return string|null A string with an error message if the image could not be deleted, null if successful
     */
    public function delete_feed_entry(int $entry_id)
    {
        $entry = $this->feedRepository->get_feed_entry($entry_id);

        if ($entry->user_id != $this->sessionService->get_active_user_id()) {
            return "User doesn't own entry";
        }

        $this->feedRepository->delete_entry($entry->entry_id);

        // If no more entries refers the image, we can safely delete it
        if (count($this->feedRepository->get_entries_referring_image_id($entry->image_id)) == 0) {
            $this->imageService->delete_image($entry->image_id);
        }
    }

}