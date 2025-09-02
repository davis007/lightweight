<?php

namespace Core;

use Symfony\Component\Mailer\Transport;
use Symfony\Component\Mailer\Mailer as SymfonyMailer;
use Symfony\Component\Mime\Email;

class Mailer
{
    private $mailer;
    private $defaultFrom;

    public function __construct()
    {
        $dsn = getenv('MAILER_DSN');
        $this->defaultFrom = getenv('MAIL_FROM_ADDRESS');
        $transport = Transport::fromDsn($dsn);
        $this->mailer = new SymfonyMailer($transport);
    }

    public function sendMail(string $to, string $subject, string $body, string $from = null): void
    {
        $from = $from ?? $this->defaultFrom;

        $email = (new Email())
            ->from($from)
            ->to($to)
            ->subject($subject)
            ->html($body);

        $this->mailer->send($email);
    }
}
