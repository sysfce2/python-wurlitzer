# Duper

Capture C-level stdout/stderr in Python via `os.dup2`.

## Install

    pip install duper

## Usage:

Capture stdout/stderr in pipes:

```python
from duper import capture

with capture() as (out, err):
    call_some_c_function()

stdout = out.read()
```

Capture stdout/stderr in StringIO:

```python
from io import StringIO
from duper import capture, STDOUT

out = StringIO()
with capture(stdout=out, stderr=STDOUT):
    call_some_c_function()

stdout = out.getvalue()
```

Forward C-level stdout/stderr to Python sys.stdout/stderr,
which may already be forwarded somewhere by the environment, e.g. IPython:

```python
from duper import redirect_to_sys

with redirect_to_sys():
    call_some_c_function()
```

