from firefox_tools.firefox_tools import FirefoxTools


def test_return_code() -> None:
    application = FirefoxTools([])
    assert application.run() == 0
