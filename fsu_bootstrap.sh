# Install Drupal modules
wget https://raw.githubusercontent.com/fsulib/islandora7x_aws_fsu_renegade/master/custom_drupal_modules.txt -O /tmp/custom_drupal_modules.txt
while read line
do
  echo "\nInstalling $line..." >> /root/drupal-installs.txt
  /root/.composer/vendor/bin/drush --root=/var/www/html -y dl $line >> /root/drupal-installs.txt
  #echo "\nEnabling $line..." >> /root/drupal-installs.txt
  #/root/.composer/vendor/bin/drush --root=/var/www/html -y en $line
  echo "\n" >> /root/drupal-installs.txt
done < /tmp/custom_drupal_modules.txt


# Install Islandora modules
wget https://raw.githubusercontent.com/fsulib/islandora7x_aws_fsu_renegade/master/custom_islandora_modules.txt -O /tmp/custom_islandora_modules.txt
while read line
do
  echo "\nInstalling $line..." >> /root/islandora-installs.txt
  git clone https://github.com/$line >> /root/islandora-installs.txt
  #echo "\nEnabling $line..." >> /root/islandora-installs.txt
  #/root/.composer/vendor/bin/drush --root=/var/www/html -y en $line
  echo "\n" >> /root/islandora-installs.txt
done < /tmp/custom_islandora_modules.txt
