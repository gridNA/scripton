# Scripton

Do you have long build time in xCode? Do you want to learn German language? This script is for you. It allows developer to learn german words during the building time, 10 new words (German-English) a day.

## Requirements

- Xcode 6.3+

## Installation

Install `gems`:

```ruby
gem install pry
gem install uri
```

Install `mpg123`:

```ruby
brew install mpg123
```

## How

1) Create a folder in your Mac, where you will copy `script.rb`, `script_runner.sh`, `script_ender.sh`
2) Open `script_runner.sh` and change path to your local path to ruby script in line

```
ruby HERE_SHOULD_BE_YOUR_PATH/ruby_1.rb
```
3) Open `script_ender.sh` and do the same with path in line 

```
process_id=`ps aux|grep "ruby HERE_SHOULD_BE_YOUR_PATH/ruby_1.rb"|grep -v grep | awk '{ print $2 }'`
```
4) Open `XCode`
5) Go to `Preferences`
6) Select `Behaviours` tab and in `Build` section select `Start`. Check checkbox `Run` and select `script_runner.sh`
7) In `Build` xection select `Succeeds`. Check checkbox `Run` and select `script_ender.sh`. Do the same for `Fails`.

Than run the project and enjouy German words.

## Example

![Example](example.png)

##Note

It is possible also translate to such languages:

- german-english
- german-chinese
- german-french
- german-italian
- german-polish
- german-portuguese
- german-russian
- german-spanish
- german-swedish
- german-turkish

To translate to differnt language do the followed:

Open `script.rb` and paste in line `23` version of tranlation you need instead of `german-english`

```
url = 'http://en.bab.la/dictionary/german-english/' + word
```

Other languages will be supported soon.

##Important

If script does not stop when you expected, go to teminal and run the `script_ender.sh` script there.
