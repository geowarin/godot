using System.Diagnostics.CodeAnalysis;

namespace Godot.SourceGenerators.Sample;

[SuppressMessage("ReSharper", "RedundantNameQualifier")]
public partial class Methods : Godot.Object
{
    private void MethodWithOverload()
    {
    }

    private void MethodWithOverload(int a)
    {
    }

    private void MethodWithOverload(int a, int b)
    {
    }
}
