# GDUnit4 resources as reference.
# Repo : https://github.com/MikeSchulze/gdUnit4?tab=readme-ov-file
# Docs : https://mikeschulze.github.io/gdUnit4/
# Video: https://youtu.be/CreugthdgJ0
# 
# For tests you may want to follow the Arrange-Act-Assert (AAA) pattern in
# order for your tests to be read more easily and naturally.
# https://docs.telerik.com/devtools/justmock/basic-usage/arrange-act-assert
extends GdUnitTestSuite


func before_test() -> void:
    pass


## Verify that GDUnit4 is working correctly.
func test_smoke():
    # Given these two test variables...
    var addend = randi_range(1, 5)
    var augend = randi_range(6, 9)

    # ... we'd like to know the smaller of the two...
    var smaller = "addend" if min(addend, augend) == addend else "augend"

    # ... and assert that the addend is always guaranteed to be smaller.
    assert_str(smaller).is_equal("addend")
