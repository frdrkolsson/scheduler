# Scheduler

A simple scheduler running in docker, using ruby and sidekiq. Has cron support via sidekiq-cron

## How to use

1. Clone repository
2. Run `docker-compose up`
3. Profit

For more advanced uses, start it with systemd

```ini
# /etc/systemd/system/scheduler.service
[Unit]
Description=Dockerized Scheduler - A scheduler for simple jobs
Requires=docker.service
After=docker.service

[Service]
Type=simple
RemainAfterExit=yes
Restart=on-failure
ExecStart=/usr/local/bin/docker-compose -f /path/to/folder/docker-compose.yml up -d
ExecStop=/usr/local/bin/docker-compose -f /path/to/folder/docker-compose.yml down

[Install]
WantedBy=default.target
```

And enable service with systemctl enable scheduler

## Configuration

Add new scheduled workers by creating new workers like `app/workers/site_refresher_worker.rb`, and add the new worker to `config/schedule.yml`

Check [https://crontab.guru](https://crontab.guru) for cron options.
