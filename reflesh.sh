if [ -e cookbooks ]; then
    rm -r cookbooks
fi
bundle exec berks vendor cookbooks
vagrant provision