## Introduction

Simple Ruby implementation of Array#flatten method

## Installation

```bash
git clone https://github.com/railis/my_flatten.git
cd my_flatten
bundle install
```

## Running specs

```bash
rake
```

## Usage

```ruby
require 'path/to/my_flatten/lib/my_flatten'

[1, [2, 3], 4].my_flatten # => [1, 2, 3, 4]
```
