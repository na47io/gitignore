# Gitignore Generator

A command-line tool to generate .gitignore files for different programming languages using the gitignore.io API.

## Installation

Install directly using curl:
```bash
curl -fsSL https://raw.githubusercontent.com/na47io/gitignore/main/install.sh | sh
```

The script will install the tool to `~/.local/bin`. Make sure this directory is in your PATH.

## Usage

Generate a .gitignore file for a specific programming language:
```bash
gitignore python
```

Generate a .gitignore file in a specific directory:
```bash
gitignore python -o /path/to/directory
```

### Options:
- `<language>`: Required. The programming language to generate rules for
- `-o, --output`: Optional. Specify output directory (default: current directory)

## Requirements

- curl
- bash
- Internet connection (to access gitignore.io API)

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

MIT License
