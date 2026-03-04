package main

import (
	"log"
	"os"
	"os/exec"
	"strings"
)

func main() {
	run("go", "install", "github.com/caddyserver/xcaddy/cmd/xcaddy@latest")

	// first argument is the build subcommand
	args := []string{"build"}

	// second argument is the version, which can be a ref (tag, commit SHA, or branch)
	version := os.Getenv("CADDY_VERSION")
	if version != "" {
		args = append(args, version)
	}

	// remaining args are flags, usually to add plugins
	plugins := strings.FieldsSeq(os.Getenv("CADDY_PLUGINS"))
	for p := range plugins {
		args = append(args, "--with", p)
	}

	log.Println("Starting build")

	run("xcaddy", args...)

	// print some useful debug info to the logs
	log.Println("Build successful")

	run("./caddy", "environ")
	run("./caddy", "build-info")
	run("./caddy", "list-modules")
}

// run runs the command at name, with the given arguments.
// If there is an error, the program exits, passing the exit code through.
func run(name string, args ...string) {
	cmd := exec.Command(name, args...)
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	log.Println("EXEC", cmd.Args)
	if err := cmd.Run(); err != nil {
		log.Printf("command %v failed: %v\n", cmd.Args, err)
		if exitErr, ok := err.(*exec.ExitError); ok {
			os.Exit(exitErr.ExitCode())
		}
		os.Exit(1)
	}
}
