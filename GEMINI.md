# Agent Guidelines for Parallel Work

To support multiple agents working in parallel, please follow these instructions:

1. **Create an Isolated Subdirectory**: Create a directory for your work, for example, `workspaces/agent-unique-id`. Do not work directly in the root directory if you can avoid it.
2. **Clone the Repository**: Clone the main repository into your isolated subdirectory.
   ```bash
   git clone . workspaces/agent-unique-id
   ```
3. **Work in the Subdirectory**: Perform all yours changes, tests, and commits within that subdirectory.
4. **Commit Your Changes**: Once your task is complete, commit your changes within the subdirectory's repository.
5. **Merge Back to Root**: From the root directory, merge your changes back.
   ```bash
   git pull ./workspaces/agent-unique-id main --no-rebase
   ```
6. **Handle Conflicts**: Resolve any merge conflicts that arise in the root directory.
7. **Clean Up**: Remove your isolated subdirectory after the merge is successful.

## Example Workflow

If you are working on a feature:
```bash
mkdir -p workspaces/my-feature
git clone . workspaces/my-feature
cd workspaces/my-feature
# ... make changes ...
git add .
git commit -m "feat: my new feature"
cd ../..
git pull ./workspaces/my-feature main --no-rebase
rm -rf workspaces/my-feature
```
